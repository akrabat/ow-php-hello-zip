<?php

require __DIR__ . '/vendor/autoload.php';
require __DIR__ . '/output.php';

use Ramsey\Uuid\Uuid;

function main(array $args) : array
{
    echo "Started my PHP Action - this is a log entry";

    return output([
        "greeting" => "Hello $name!",
        "time" => date("r"),
        "uuid" => Uuid::uuid4(),
    ]);
}
