<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Safe extends Model
{
    protected $table = 'safes';
    protected $primaryKey = 'SafeID';
    public $timestamps = false;

    protected $fillable = ['Type', 'Location', 'Capacity'];

    public function golds()
    {
        return $this->hasMany(Gold::class, 'SafeID');
    }

    public function transactions()
    {
        return $this->hasMany(Transaction::class, 'SafeID');
    }

}
