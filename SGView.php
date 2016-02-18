<?php
if (!defined('MEDIAWIKI')) die();
$sgIP = dirname( __FILE__ );
require_once($sgIP."/fpdf.php");

class SGView extends SpecialPage {
        public function SGView() {
                global $wgLanguageCode;
                SpecialPage::SpecialPage('StoryGenerator');
                wfLoadExtensionMessages( 'StoryGenerator' );

        }

        function execute($query) {
                $this->setHeaders();
                doStoryGenerator($query);
        }
}

class SGPDF extends FPDF {

	var $B;
	var $I;
	var $U;
	var $HREF;

	function SGPDF($orientation='P', $unit='mm', $size='A4') {
		$this->FPDF($orientation,$unit,$size);
		$this->B = 0;
		$this->I = 0;
		$this->U = 0;
		$this->HREF = '';
	}

	function Footer() {
		$this->SetY(-15);
		$this->SetFont('Arial', 'I', 8);
		$this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
	}

	function WriteHTML($html) {
		$html = str_replace("\n",'',$html);
		$a = preg_split('/<(.*)>/U',$html,-1,PREG_SPLIT_DELIM_CAPTURE);
		foreach($a as $i=>$e) {
		if($i%2==0) {
			if($this->HREF)
				$this->PutLink($this->HREF,$e);
			else
				$this->Write(5,$e);
		} else {
			if($e[0]=='/')
				$this->CloseTag(strtoupper(substr($e,1)));
			else {
				$a2 = explode(' ',$e);
				$tag = strtoupper(array_shift($a2));
				$attr = array();
				foreach($a2 as $v) {
					if(preg_match('/([^=]*)=["\']?([^"\']*)/',$v,$a3))
						$attr[strtoupper($a3[1])] = $a3[2];
				}
				$this->OpenTag($tag,$attr);
			}
		}
		}
	}

	function OpenTag($tag, $attr) {
		// Opening tag
		if($tag=='B' || $tag=='I' || $tag=='U')
			$this->SetStyle($tag,true);
		if($tag=='A')
			$this->HREF = $attr['HREF'];
		if($tag=='BR')
			$this->Ln(5);
	}

	function CloseTag($tag) {
		// Closing tag
		if($tag=='B' || $tag=='I' || $tag=='U')
			$this->SetStyle($tag,false);
		if($tag=='A')
			$this->HREF = '';
	}

	function SetStyle($tag, $enable) {
		// Modify style and select corresponding font
		$this->$tag += ($enable ? 1 : -1);
		$style = '';
		foreach(array('B', 'I', 'U') as $s) {
			if($this->$s>0)
				$style .= $s;
		}
		$this->SetFont('',$style);
	}

	function PutLink($URL, $txt) {
		//$this->SetTextColor(0,0,255);
		$this->SetStyle('U',true);
		$this->Write(5,$txt,$URL);
		$this->SetStyle('U',false);
		$this->SetTextColor(0);
	}
}

function getStoryCategory($category) {
	$req = new FauxRequest( array(
			'action' => 'query',
			'list' => 'categorymembers',
			'cmtitle' => 'Category:'.$category,
			'cmdir' => 'asc',
			'cmlimit' => 'max',
			'cmnamespace' => 0
		));

	$main = new ApiMain($req);
	$main->execute();
	$data = $main->getResultData();

	return $data['query']['categorymembers'];
}

function storyCopyResultsIntoArray($results) {
	$reply = array();
	$holder = array();
	while ($row = $results->fetchRow()) {
		array_push($holder, $row);
	}
	$holderLen = sizeof($holder) - 1;
	$count = 0;
	while(sizeof($reply) < sizeof($holder) && count <= 100) {
		$randNum = rand(0, $holderLen);
		if (!storyIsInArray($reply, $holder[$randNum])) array_push($reply, $holder[$randNum]);	
		$count;
	}
	return $reply;
}

function storyIsInArray($holder, $value) {
	for ($i = 0; $i < sizeof($holder); $i++) {
		if ($holder[$i] == $value) return true;
	}
	return false;
}

function storyGetWikiName($name) {
	return html_entity_decode(rawurldecode(str_replace('_', ' ', $name)));
}

function doStoryGenerator($query) {
	global $wgOut, $wgRequest, $wgUser, $wgCanonicalNamespaceNames, $wgContLang;
        $skin = $wgUser->getSkin();

	$submitted = $wgRequest->getVal('submitted');
	if (!strlen($submitted)) $submitted = false;

	$wgOut->setPageTitle("Story Generator");

	$body = "";
	if ($submitted) {
		//API Call for Planets
		//api.php?action=query&list=categorymembers&cmtitle=Category:Planets&cmdir=asc&cmlimit=max&cmnamespace=0
		$planets = getStoryCategory('Planets');
		$planetsLen = sizeof($planets) - 1;
		$planetRand = rand(0, $planetsLen);
		$planet = $planets[$planetRand]['title'];
		$secondPlanetRand = $planetRand;
		$secondPlanet = "";
		$fileName = session_id().'.pdf';
		while ($secondPlanetRand == $planetRand) {
			$secondPlanetRand = rand(0, $planetsLen);
			$secondPlanet = $planets[$secondPlanetRand]['title'];
		}
		//echo($secondPlanet);

		//API Call for space vehicles
		//api.php?action=query&list=categorymembers&cmtitle=Category:Space+Vehicles&cmdir=asc&cmlimit=max&cmnamespace=0
		$ships = getStoryCategory('Space_Vehicles');
		//print_r($ships);
		$shipsLen = sizeof($ships) - 1;
		$shipsRand = rand(0, $shipsLen);
		$ship = $ships[$shipsRand]['title'];

		//API Call for cities
		//api.php?action=query&list=categorymembers&cmtitle=Category:Cities&cmdir=asc&cmlimit=max&cmnamespace=0
		//$cities = getStoryCategory('Cities');

		$gender = 'woman';
		$age = 30;
		$genderRand = rand(0, 99);
		if ($genderRand >= 0 && $genderRand < 35) {
			$gender = 'man';
			$age = rand(18, 60);
		} else if ($genderRand >= 35 && $genderRand < 70) {
			$gender = 'woman';
			$age = rand(18, 60);
		} else if ($genderRand >= 70 && $genderRand < 85) {
			$gender = 'girl';
			$age = rand(12, 17);
		} else if ($genderRand >= 85 && $genderRand <= 99) {
			$gender = 'boy';
			$age = rand(12, 17);
		}

		$db = wfGetDB(DB_SLAVE);
		$plotSQL = "SELECT story_value, appender, city, wiki_key, needs_ship, needs_planet FROM ".$db->tableName('story_generator').
				" WHERE story_key = 'mainplot' AND (gender = '".$gender."' OR gender IS NULL) AND persons = 1";

		$conflictSQL = "SELECT story_value, appender, city, wiki_key, needs_ship, needs_planet FROM ".$db->tableName('story_generator').
				" WHERE story_key = 'conflict' AND (gender = '".$gender."' OR gender IS NULL) AND persons = 1";
		
		$results = $db->query($plotSQL, __METHOD__, true);
		$plots = storyCopyResultsIntoArray($results);
		$plotLen = sizeof($plots) -1;
		$plotRand = rand(0, $plotLen);
		$plot = $plots[$plotRand];
		$db->freeResult($results);

		$summaryQuery;
		if (strlen($plot['city'])) {
			$summaryQuery = str_replace(' ', '_', $plot['city']);
		} else {
			$summaryQuery = str_replace(' ', '_', $planet);
		}

		if (strlen($plot['wiki_key'])) $summaryQuery .= "|".$plot['wiki_key'];

		$results = $db->query($conflictSQL, __METHOD__, true);
		$conflicts = storyCopyResultsIntoArray($results);
		$conflictsLen = sizeof($conflicts) -1;
		$conflictRand = rand(0, $conflictsLen);
		$conflict = $conflicts[$conflictRand];
		$db->freeResult($results);

		if (strlen($conflict['wiki_key'])) $summaryQuery .= "|".$conflict['wiki_key'];
		$textHeader = "Your story, should you choose to accept it:";

		$body = "<h4>".$textHeader."</h4>";

		$storyText = "A " . $gender . " (" . $age . ")";

		if ($plot['needs_planet'] == 'T') {
			$storyText .= " from ".$secondPlanet;
			$summaryQuery .= '|'.str_replace(' ', '_', $secondPlanet);
		}

		if (strlen($plot['city'])) {
			$storyText .= " ".$plot['story_value'] . " in " . $plot['city'];
		} else {
			if (strpos($plot['story_value'], 'on') === false) {
				$storyText .= " ".$plot['story_value'] . " ".$planet;
			} else {
				$storyText .= " ".$plot['story_value'] . " " . $planet;
			}
		}

		if ($plot['needs_ship'] == 'T') {
			$storyText .= " aboard a " .$ship;
			$summaryQuery .= '|'.str_replace(' ', '_', $ship);
		}

		$storyText .= " " . $plot['appender'] . " " . $conflict['story_value'];
		$story = "<p>".$storyText."</p>";

		$req = new FauxRequest( array(
			'action' => 'summaries',
			'pages' => $summaryQuery
                ));

		$main = new ApiMain($req);
		$main->execute();
		$data = $main->getResultData();

		$body .= $story;
		$pdfIntro = file_get_contents(dirname(__FILE__).'/text/header_intro.txt');
		$introStoryHeader = file_get_contents(dirname(__FILE__).'/text/story_header.txt');
		$introStory = file_get_contents(dirname(__FILE__).'/text/story_body.txt');
		$articleHeader = file_get_contents(dirname(__FILE__).'/text/article_header.txt');
		$articleIntro = file_get_contents(dirname(__FILE__).'/text/article_intro.txt');

		$pdf = new SGPDF();
		$pdf->AliasNbPages();
		$pdf->SetLeftMargin(15);
		$pdf->SetRightMargin(15);
		$pdf->AddPage();
		$pdf->Image(dirname(dirname(dirname(dirname(__FILE__)))).'/wp-content/themes/urs-erudite/images/urs-login.png', 70);
		$pdf->SetFont('Arial','I',10);
		$pdf->Ln(10);
		$pdf->Write(4, $pdfIntro);
		$pdf->Ln(10);
		$pdf->SetFont('Arial','B',14);
		$pdf->Write(5, $textHeader);
		$pdf->Ln(10);
		$pdf->SetFont('Arial','',12);
		$pdf->Write(6, $storyText);
		$pdf->Ln(14);
		$pdf->SetFont('Arial','B',14);
		$pdf->Write(5, $articleHeader);
		$pdf->SetFont('Arial','',12);
		$pdf->Ln(0);
		$pdf->SetFont('Arial','I',10);
		$pdf->Write(5, $articleIntro);
		$pdf->Ln(6);

		if (sizeof($data['summaries'])) {
			$body .= "<br/><br/><h4>".$articleHeader."</h4>";
			$body .= "<p>".$articleIntro."</p><br/>";
		}
		$body .= "<span class=\"story_generator_content\">";
		for ($i = 0; $i < sizeof($data['summaries']); $i++) {
			$summary = $data['summaries'][$i];
			$body .= "<a href=\"" . $summary['link'] . "\">". $summary['title'] . "</a><br/>";
			$body .= $summary['summary'];
			$body .= "<br/><br/>";
			$pdf->SetFont('Arial','B',12);
			$pdf->Write(6, $summary['title']);
			$pdf->Ln(6);
			$pdf->SetFont('Arial','',12);
			$pdf->Write(6, $summary['summary']);
			$pdf->Ln(6);
			$pdf->SetTextColor(0, 0, 238);
			$pdf->Write(6, $summary['link'], $summary['link']);
			$pdf->SetTextColor(0);
			$pdf->Ln(12);

		}
		$body .= "</span>";

		$pdf->AddPage();
		$pdf->SetFont('Arial','B',14);
                $pdf->Ln(10);
                $pdf->Write(6, $introStoryHeader);
		$pdf->SetFont('Arial','',12);
                $pdf->Ln(0);
                $pdf->WriteHTML($introStory);
                $pdf->Ln(16);

		$tipsHeader = file_get_contents(dirname(__FILE__).'/text/tips_header.txt');
		$tipsIntro = file_get_contents(dirname(__FILE__).'/text/tips_intro.txt');
		$tips = file_get_contents(dirname(__FILE__).'/text/tips.txt');
		$legalHeader = file_get_contents(dirname(__FILE__).'/text/legal_header.txt');
		$legal= file_get_contents(dirname(__FILE__).'/text/legal_body.txt');

		$pdf->SetFont('Arial', 'B', 14);
		$pdf->Write(6, $tipsHeader);
                $pdf->Ln(0);
		$pdf->SetFont('Arial','I',10);
		$pdf->Write(5, $tipsIntro);
		$pdf->SetFont('Arial','',12);
                $pdf->Ln(2);
		$pdf->WriteHTML($tips);
                $pdf->Ln(16);
		$pdf->SetFont('Arial', 'B', 14);
		$pdf->Write(6, 'Suggested Sites For Publication');
		$pdf->Ln(6);
		$pdf->SetFont('Arial', '', 10);
		$pdf->SetTextColor(0, 0, 238);
		$pdf->Write(6, 'Unified Republic of Stars', 'http://www.unifiedrepublicofstars.com/contribute');
		$pdf->Ln(6);
		$pdf->Write(6, 'Wattpad', 'http://www.wattpad.com/');
                $pdf->Ln(16);
		$pdf->SetTextColor(0);
		$pdf->SetFont('Arial', 'B', 14);
		$pdf->Write(6, $legalHeader);
                $pdf->Ln(0);
		$pdf->SetFont('Arial','',10);
		$pdf->WriteHTML($legal);
                $pdf->Ln(15);
		$pdf->Image(dirname(dirname(dirname(dirname(__FILE__)))).'/wp-content/themes/urs-erudite/images/CC-BY-NC-SA.png', 93);
		$pdf->Output(dirname(__FILE__).'/cache/'.$fileName, 'F');

		$chmodval = chmod(dirname(__FILE__).'/cache/'.$fileName, 0777);

		$body .= '<p><b>Download this information in <a href="/wiki/extensions/StoryGenerator/cache/'.$fileName.'">a handy PDF</a> for future reference.</b></p>';

	} else {
		$body = <<<END
			<p>Generate a story plot set within the Unified Republic of Stars storyworld.</p>
			<p>This helpful tool will help anyone get over the writer's block that sets in when looking at where to begin. By just hitting
			the generate button below, a story will be randomly generated with links to helpful articles on the plot and a downloadable PDF
			will be created so you can remember it all later.<p>
			<p>Remember that all work created from the Unified Republic of Stars storyworld is bound by the Creative Commons <a href="http://creativecommons.org/licenses/by-nc-sa/3.0/">BY-NC-SA</a> license and may not be distributed for commercial purposes. However, if you'd like to share your creation, feel free to post it on places like <a href="http://www.wattpad.com">Wattpad</a> or use the <a href="/contribute">contribution</a> form and see it posted on the Unified Republic of Stars site itself.</p>
			<form action="/reference/Special:StoryGenerator" method="post">
				<input type="hidden" name="submitted" value="true"/>
				<input type="submit" value="Generate Me A Story!"/>
			</form>
END;
	}

	$wgOut->addHTML($body);
}
?>
