# audio_players_issue

This repo demonstrates an issue with the AudioPlayer class when streaming from either a Url or local file. When subscribing to the onPositionChanged stream it seems as though the position "resets" back to zero every N number of seconds.

## To reproduce

- Press play
- Let the song play
- Observe the current position reset to zero after 20 seconds

## Affected systems

This has been tested exclusively on a MacBook Pro M2 Max, and may not affect other systems.
