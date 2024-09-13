<?php 
namespace App\Services;

use GuzzleHttp\Client;

class HolidayService
{
    public function fetchHolidays($country, $year)
    {
        $client = new Client();
        $response = $client->request('GET', 'https://calendarific.com/api/v2/holidays', [
            'query' => [
                'api_key' => "iqjyceMWogalRQ8I6jn65J9rGiIAoJda",
                'country' => $country,
                'year' => $year
            ]
        ]);

       // return json_decode($response->getBody()->getContents(), true)['response']['holidays'];

       $data = json_decode($response->getBody()->getContents(), true);

        // Log the entire response for inspection
        \Log::info('Calendarific API response:', $data);

        // Validate the response structure
        if (isset($data['response']['holidays'])) {
            return $data['response']['holidays'];
        } else {
            throw new \Exception('API response does not contain holidays data');
        }
    }
}