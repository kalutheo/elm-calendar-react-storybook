# elm-calendar
Simple demo showing how ReactStoryBook can be used with an ELM App


This demo demonstrates a simple calendar built with Elm and "storybooked" using ReactStoryBook 
ReactStorybook is an amazing tool that provides the ability to isolate UI Components for testing/documentation purposes. 

## How can we achieve that ? 

- The Calendar is broken down into two small Apps (CalendarHeader, CalendarDay)
- We use `programWithFlags`so that we can inject data from Javascript to ELM
- We import ELM App into ReactStoryBook thanks to the elm-webpack-loader
- These ELM Apps are then wrapped into React thantks to a small Wrapper (cf:  src/stories/Elm.js)

We can now write happy ELM stories :-)
