use v6;
use Algorithm::BloomFilter::Faster;
use Test;

subtest {
    my Algorithm::BloomFilter::Faster $filter .= new(
        error-rate => 0.1,
        capacity   => 10,
    );

    isa-ok $filter, 'Algorithm::BloomFilter::Faster';

}, 'Test instance';

subtest {
    my Algorithm::BloomFilter::Faster $filter .= new(
        error-rate => 0.01,
        capacity   => 100,
    );

    for 1 .. 20 -> $i {
        $filter.add('hogehoge' x $i);

        ok $filter.check('hogehoge' x $i);
    }

}, 'Test add/check';

done-testing;
