<?

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    protected $table = 'transactions';
    protected $primaryKey = 'TransactionID';
    public $timestamps = false;

    protected $fillable = ['UserID', 'GoldID', 'SafeID', 'TransactionType', 'Date', 'Weight', 'Price'];

    public function user()
    {
        return $this->belongsTo(User::class, 'UserID');
    }

    public function gold()
    {
        return $this->belongsTo(Gold::class, 'GoldID');
    }

    public function safe()
    {
        return $this->belongsTo(Safe::class, 'SafeID');
    }

}