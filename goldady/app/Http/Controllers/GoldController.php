<?php
namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Gold;
use Illuminate\Http\Request;

class GoldController extends Controller
{
    public function index()
    {
        $Golds = Gold::all();
        return response()->json($Golds);
    }

    public function show($id)
    {
        $Gold = Gold::find($id);
        return response()->json($Gold);
    }

    public function store(Request $request)
    {
        $Gold = Gold::create($request->all());
        return response()->json($Gold, 201);
    }

    public function update(Request $request, $id)
    {
        $Gold = Gold::findOrFail($id);
        $Gold->update($request->all());
        return response()->json($Gold, 200);
    }

    public function destroy($id)
    {
        Gold::destroy($id);
        return response()->json(null, 204);
    }
}
