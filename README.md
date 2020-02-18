# Story Generator

A story world story generator! Kinda...

Really, this is just a random assembly of plot elements that can be used to create a story "idea". While the ideas can sometimes come out a little non-sensical, they're sometimes fun to play with. Also, they can tie back to your wiki with particular story elements.

And if this is used in conjunction with [PageSummaries](https://github.com/colinferm/wiki-page-summaries) then, when it generates the PDF for you, it will also include helpful little article snippets curated from your wiki to help potential writers along.

It's a stupid thing but relatively unique to the MediaWiki world so...

## Set Up

First thing to do is to install [PageSummaries](https://github.com/colinferm/wiki-page-summaries) so you can include topic summaries into your generated PDF files.

The next thing to do is to start editing StoryGenerator.sql as this is the database file that will contain all the useful information that will be put into the story "ideas".

Don't know SQL? Not really much of a problem.

Everything can be boiled down to two different ideas: `mainplot` and `conflict`. 

`Mainplot` is more like a setup. Think, "An ordinary boy living on an ordinary world had a good life."

`Conflict` is what drives the plot forward. Think, "When he saw his father run over by bank robbers and swore that day to bring all evil-doers to justice."

Since the generator randomly assigns a gender, if a story has a particular gender focus, this can be entered with the `gender` key so it will filter out stories that aren't assigned to the randomly picked gendr focus. `appender` is if you want to tie the main plot into the conflict. So it might be:

`A normal person in a normal city had a great life` but `they knew the cops were looking for them for what they'd done.`

And then most importantly, `wiki_key` is where the URL formatted titles of any wiki articles should be put with a `|` separating if there is more than one. This way the story generator can reach out and link to these articles should there be any and include them under the story idea and in the generated PDF.

See? Pretty easy.