<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Holiday;
//use App\Services\HolidayService;
use App\Services\HolidayService;

class HolidayController extends Controller
{
    protected $holidayService;

    public function __construct(HolidayService $holidayService){
        $this->holidayService = $holidayService;
    }

    public function fetchHolidays($country, $year){
        $holidays = $this->holidayService->fetchHolidays($country, $year);

        foreach($holidays as $holiday){
            $dateTime = new \DateTime($holiday['date']['iso']);
            Holiday::Create([
                'name' => $holiday['name'],
                'date' => $dateTime->format('Y-m-d'),
                'type' => $holiday['type'][0],
            ]);
        }

        return response()->json(['message' => 'Holidays fetched and stored successfully']);
    }

    public function fetchHolidaysview(){
        $holidays = Holiday::all();
        //var_dump($holidays);
        //return view('index', compact('holidays'));
        return response()->json($holidays);
    }

    public function showView() {
        return view('index');  
    }

    public function destroy($id){
        $holiday = Holiday::find($id);

        // Check if the holiday exists
        if ($holiday) {
            // Delete the holiday
            $holiday->delete();

            // Return a JSON response for success
            return response()->json([
                'success' => true,
                'message' => 'Holiday deleted successfully!'
            ]);
        } else {
            // If holiday not found, return an error message
            return response()->json([
                'success' => false,
                'message' => 'Holiday not found!'
            ], 404);
        }
    }

    public function edit($id){
        $holiday = Holiday::find($id);

        if ($holiday) {
            return response()->json([
                'success' => true,
                'id' => $holiday->id,
                'name' => $holiday->name,
                'date' => $holiday->date,
                'type' => $holiday->type
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Holiday not found!'
            ], 404);
        }
    }

    public function update(Request $request, $id){
        $request->validate([
            'name' => 'required|string|max:255',
            'date' => 'required|date',
            'type' => 'required|string|max:255',
        ]);

        $holiday = Holiday::find($id);

        if ($holiday) {
            $holiday->update([
                'name' => $request->input('name'),
                'date' => $request->input('date'),
                'type' => $request->input('type'),
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Holiday updated successfully!'
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Holiday not found!'
            ], 404);
        }
    }

    // public function showCalendar(){
    //     $holidays = Holiday::all();
    //     return view('calendar', compact('holidays'));
    // }

    // public function showYearlyCalendar($year){
    //     $holidays = Holiday::whereYear('date', $year)->get();
    //     return view('yearly-calendar', compact('holidays', 'year'));
    // }

    public function showCalendar(Request $request)
    {
        $year = $request->input('year', date('Y'));
        $month = $request->input('month', date('m'));

        $holidays = Holiday::whereYear('date', $year)
            ->whereMonth('date', $month)
            ->get();

        $calendar = $this->generateCalendar($year, $month);

        return view('calendar', compact('holidays', 'calendar', 'year', 'month'));
    }

    private function generateCalendar($year, $month)
    {
        $startDate = new \DateTime("$year-$month-01");
        $endDate = new \DateTime($startDate->format('Y-m-t'));
        $calendar = [];

        while ($startDate <= $endDate) {
            $calendar[] = $startDate->format('Y-m-d');
            $startDate->modify('+1 day');
        }

        return $calendar;
    }
}
