# Raspberry Casket
A fast and small open source Pretracker replayer

## Raspberry Casket Player V1.0 (26-Dec-2022)

Provided by Chris 'platon42' Hodges <chrisly@platon42.de>

Rewritten by *platon42/Desire* based on a resourced, binary identical
version of the original Pretracker V1.0 replayer binary provided
by *hitchhikr* (thanks!), originally written in C by *Pink/Abyss*.

This version is the hard work of reverse engineering all the
offsets, removing all the C compiler crud, removing dead and
surplus code (maybe artefacts from earlier ideas that did nothing),
optimizing the code where possible. This resulted in both reduced
size of the replayer, faster sample calculation and speeding the
tick routine up significantly.

I also added a few optional features that come in handy, such as
song-end detection and precalc progress support.

It took me more than a month and it was not fun.

Also: Open source. It's 2022, keeping the code closed is just not
part of the demoscene spirit (anymore?), at least for a replayer.

Also note that this is not the final state of the source code.
I could go over many places still and try to rework them.
But I wanted the code to be out in public.

### Verification

The replayer has been verified on about 60 Pretracker tunes to
create an identical internal state for each tick and identical
samples (if certain optimizations switches are disabled).

I might have introduced bugs though. If you find some problems,
please let me know under chrisly@platon42.de. Thank you.

### Usage

The new replayer comes as a drop-in binary replacement if you wish.
In this case you will get faster sample generation (about 12%
faster on 68000) and about 45% less CPU time spent. However, you
won't get stuff as song-end detection and precalc progress this way.
This mode uses the old CPU DMA wait that takes away 8 raster lines.

If you want to get rid of the unnecessary waiting, you can switch
to a copper driven audio control. If you want to use the top portion
of the copperlist for this, you probably need to double buffer it.
Otherwise, you could also position the copperlist at the end of
the display and use single buffering if you call the tick routine
during the vertical blank.

Please use the documented sizes for the `MySong` and `MyPlayer` data
structures, which are the symbols `sv_SIZEOF` and `pv_SIZEOF`
respectively (about 2K and 12K with volume table).

The source needs two common include files to compile (`custom.i` and
`dmabits.i`). You should leave assembler optimizations enabled.

1. (If you're using copper list mode, call `pre_PrepareCopperlist`.)
2. Call `pre_SongInit` with
   - a pointer to `MySong` (`mv_SIZEOF`) in `a1` and
   - the music data in `a2`.
   It will return the amount of sample memory needed in `d0`.
3. Then call `pre_PlayerInit` with
   - a pointer to `MyPlayer` (`pv_SIZEOF`) in `a0`
   - a pointer to chip memory sample buffer in `a1`
   - the pointer to `MySong` in `a2`
   - a pointer to a longword for progress information or null in `a3`
   This will create the samples, too.
4. After that, regularly call `pre_PlayerTick` with `MyPlayer` in `a0`
   and optionally the copperlist in a1 if you're using that mode).

### Size

The original C compiled code was... just bad. The new binary is
about 1/3 of the original one.

The code has been also optimized in a way that it compresses better.
The original code compressed with *Blueberry's* Shrinkler goes from
18052 bytes down to 9023 bytes.

Raspberry Casket, depending on the features compiled in, is about
6374 bytes and goes down to ~4410 bytes (in isolation).

So this means that the optimization is not just "on the outside".

### Timing

Unfortunately, the replayer is still pretty slow and has high
jitter compared to other standard music replayers.

This means it may take up to 33 raster lines (14-19 on average)
which is significant more than a standard Protracker replayer
(the original one could take about 60 raster lines worst case and
about 34 on average!).

Watch out for *Presto*, the [LightSpeedPlayer](https://github.com/arnaud-carre/LSPlayer) variant that should
solve this problem.

## Changelog

### V1.1 (unreleased)
- Optimized base displacement by reordering variables
- Further optimized ADSR code

### V1.0 (26-Dec-22)
 
- Initial release