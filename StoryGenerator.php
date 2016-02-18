<?php
if (!defined('MEDIAWIKI')) die();

define( 'URSSG_VERSION', '1.0' );

$wgExtensionCredits['specialpage'][] = array(
        'path'           => __FILE__,
        'name'           => 'URS Story Generator',
        'version'        => URSSG_VERSION,
        'author'         => 'Colin Andrew Ferm',
        'description' => 'Generates plots and aggregates related wiki articles for stories set within the Unified Republic of Stars'
);

$sgIP = dirname( __FILE__ );

$wgSpecialPages['StoryGenerator'] = 'SGView';
$wgAutoloadClasses['SGView'] = $sgIP . '/SGView.php';
$wgExtensionMessagesFiles['StoryGenerator'] = $sgIP . '/Messages.php';
$wgHooks['LoadExtensionSchemaUpdates'][] = 'storyGeneratorSchema';

function storyGeneratorSchema() {
	global $wgExtNewTables;
	$base = dirname( __FILE__ );
	$wgExtNewTables[] = array( 'story_generator', $base."/StoryGenerator.sql" );
	return true;
}
?>
