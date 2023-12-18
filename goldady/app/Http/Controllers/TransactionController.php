<?php
namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Transaction;
use App\Models\Safe;
use Illuminate\Http\Request;
use DB;

class TransactionController extends Controller
{
    public function index()
    {
        $Transactions = Transaction::all();
        return response()->json($Transactions);
    }

    public function show($id)
    {
        $Transaction = Transaction::find($id);
        return response()->json($Transaction);
    }

    public function store(Request $request)
    {
        DB::beginTransaction();
    
        try {
            $transaction = Transaction::create($request->all());
            

            $internalSafe = Safe::where('Type', 'internal')->first();
            $externalSafe = Safe::where('Type', 'external')->first();
    

            switch ($transaction->TransactionType) {
                case 'transfer':
                    $internalSafe->Capacity += $transaction->Weight;
                    $externalSafe->Capacity -= $transaction->Weight;
                    break;
                case 'buy':
                    if ($transaction->safe->Type == 'internal') {
                        $internalSafe->Capacity -= $transaction->Weight;
                    }else if ($transaction->safe->Type == 'external') {
                        $externalSafe->Capacity -= $transaction->Weight;
                    }
                    break;
                    case 'sell':
                        if ($transaction->safe->Type == 'internal') {
                            $internalSafe->Capacity += $transaction->Weight;
                        }else if ($transaction->safe->Type == 'external') {
                            $externalSafe->Capacity += $transaction->Weight;
                        }
                        break;
                // Add other cases as needed
            }
    
            // Save the updated safe capacities
            $internalSafe->save();
            $externalSafe->save();
    
            // Commit the transaction
            DB::commit();
    
            return response()->json($transaction, 201);
    
        } catch (\Exception $e) {
            // Rollback the transaction in case of error
            DB::rollback();
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function update(Request $request, $id)
    {
        $Transaction = Transaction::findOrFail($id);
        $Transaction->update($request->all());
        return response()->json($Transaction, 200);
    }

    public function destroy($id)
    {
        Transaction::destroy($id);
        return response()->json(null, 204);
    }
}
