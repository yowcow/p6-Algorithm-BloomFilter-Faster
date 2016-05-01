use v6;
use Algorithm::BloomFilter;
use NativeCall;

unit class Algorithm::BloomFilter::Faster is Algorithm::BloomFilter;

sub murmurhash(Str, uint32, uint32 --> uint32)
    is native('resources/libmurmurhash.so') { * } #XXX To replace with installed path

method calc-hash(Cool:D $key, Int:D $seed) {
    murmurhash($key, $key.chars, $seed);
}

method get-cells(Cool:D $key, Int:D :$filter-length, Int:D :$blankvec, Num:D :@salts --> Array) {
    my Int @cells;

    for @salts -> $salt {
        my Int $hash = self.calc-hash(
            $key,
            ($salt * 10 ** 10).Int % 4294967296
        ); # $seed is uint32
        @cells.push: $hash % $filter-length;
    }

    @cells;
}

=begin pod

=head1 NAME

Algorithm::BloomFilter::Faster - Faster Bloom filter with murmurhash

=head1 SYNOPSIS

  use Algorithm::BloomFilter::Faster;

=head1 DESCRIPTION

Algorithm::BloomFilter::Faster is a faster implementation of Bloom filter using murmurhash for a hash function.

=head1 METHODS

=head3 get-cells(Cool:D $key, Int:D :$filter-length, Int:D :$blankvec, Num:D :@salts --> Array)

To get cells to look for in a filter bit vector.

=head2 INTERNAL METHODS

=head4 murmurhash(Str, uint32, uint32 --> uint32)

=head4 calc-hash(Cool:D $key, Int:D $seed)

=head1 SEE ALSO

L<https://github.com/jwerle/murmurhash.c>

=head1 AUTHOR

yowcow <yowcow@cpan.org>

=head1 COPYRIGHT AND LICENSE

Copyright 2016 yowcow

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
