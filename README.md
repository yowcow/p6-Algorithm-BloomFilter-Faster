NAME
====

Algorithm::BloomFilter::Faster - Faster Bloom filter with murmurhash

SYNOPSIS
========

    use Algorithm::BloomFilter::Faster;

DESCRIPTION
===========

Algorithm::BloomFilter::Faster is a faster implementation of Bloom filter using murmurhash for a hash function.

METHODS
=======

### get-cells(Cool:D $key, Int:D :$filter-length, Int:D :$blankvec, Num:D :@salts --> Array)

To get cells to look for in a filter bit vector.

INTERNAL METHODS
----------------

#### murmurhash(Str, uint32, uint32 --> uint32)

#### calc-hash(Cool:D $key, Int:D $seed)

AUTHOR
======

yowcow <yowcow@cpan.org>

COPYRIGHT AND LICENSE
=====================

Copyright 2016 yowcow

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.
