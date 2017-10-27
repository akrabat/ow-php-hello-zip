<?php

/**
 * Output data directly if we're being called by the CLI or in HTTP web action format if
 * we're being called by curl
 */
function output(array $data, int $statusCode = 200, array$headers = ['Content-Type' => 'application/json']) : array
{
    // are we being called in web action context?
    $whiskInput = $_ENV['WHISK_INPUT'];
    if (strpos($_ENV['WHISK_INPUT'], '__ow_method') !== false) {
        return [
            'body' => $data,
            'headers' => $headers,
            'statusCode' => $statusCode,
        ];
    }

    return $data;
}
