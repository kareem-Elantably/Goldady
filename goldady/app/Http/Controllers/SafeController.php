<?php
namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Safe;
use Illuminate\Http\Request;

class SafeController extends Controller
{
    public function index()
    {
        $Safes = Safe::all();
        return response()->json($Safes);
    }

    public function show($id)
    {
        $Safe = Safe::find($id);
        return response()->json($Safe);
    }

    public function store(Request $request)
    {
        $Safe = Safe::create($request->all());
        return response()->json($Safe, 201);
    }

    public function update(Request $request, $id)
    {
        $Safe = Safe::findOrFail($id);
        $Safe->update($request->all());
        return response()->json($Safe, 200);
    }

    public function destroy($id)
    {
        Safe::destroy($id);
        return response()->json(null, 204);
    }
}
