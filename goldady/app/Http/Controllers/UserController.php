<?php
namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index()
    {
        $Users = User::all();
        return response()->json($Users);
    }

    public function show($id)
    {
        $User = User::find($id);
        return response()->json($User);
    }

    public function store(Request $request)
    {
        $User = User::create($request->all());
        return response()->json($User, 201);
    }

    public function update(Request $request, $id)
    {
        $User = User::findOrFail($id);
        $User->update($request->all());
        return response()->json($User, 200);
    }

    public function destroy($id)
    {
        User::destroy($id);
        return response()->json(null, 204);
    }
}
