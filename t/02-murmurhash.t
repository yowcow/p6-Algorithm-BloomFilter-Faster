use v6;
use Algorithm::BloomFilter::Faster;
use Test;

my Int $seed = 12345678;

is Algorithm::BloomFilter::Faster.calc-hash("hoge", $seed),          3328321342;
is Algorithm::BloomFilter::Faster.calc-hash("hogefuga", $seed),      946012105;
is Algorithm::BloomFilter::Faster.calc-hash("hogefuga" x 2, $seed),  1081591432;
is Algorithm::BloomFilter::Faster.calc-hash("hogefuga" x 4, $seed),  731304993;
is Algorithm::BloomFilter::Faster.calc-hash("hogefuga" x 8, $seed),  4219915459;
is Algorithm::BloomFilter::Faster.calc-hash("hogefuga" x 16, $seed), 4078357989;
is Algorithm::BloomFilter::Faster.calc-hash("hogefuga" x 32, $seed), 461689742;
is Algorithm::BloomFilter::Faster.calc-hash("hogefuga" x 64, $seed), 2535034671;

done-testing;
