<?php
if (!defined('MEDIAWIKI')) die();
$sgIP = dirname( __FILE__ );
require_once($sgIP."/fpdf.php");

class StoryGeneratorLib {
	public static function installSchema() {
		global $wgExtNewTables;
		$base = dirname( __FILE__ );
		$wgExtNewTables[] = array( 'story_generator', $base."/StoryGenerator.sql" );
		return true;
	}

	public static function getStoryCategory($category) {
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
		$data = $main->getResult()->getResultData();
	
		return $data['query']['categorymembers'];
	}
	
	public static function storyCopyResultsIntoArray($results) {
		$reply = array();
		$holder = array();
		while ($row = $results->fetchRow()) {
			array_push($holder, $row);
		}
		$holderLen = sizeof($holder) - 1;
		$count = 0;
		while(count($reply) < count($holder) && $count <= 100) {
			$randNum = rand(0, $holderLen);
			if (!StoryGeneratorLib::storyIsInArray($reply, $holder[$randNum])) array_push($reply, $holder[$randNum]);	
			$count;
		}
		return $reply;
	}
	
	public static function storyIsInArray($holder, $value) {
		for ($i = 0; $i < count($holder); $i++) {
			if ($holder[$i] == $value) return true;
		}
		return false;
	}
	
	public static function storyGetWikiName($name) {
		return html_entity_decode(rawurldecode(str_replace('_', ' ', $name)));
	}
}

?>