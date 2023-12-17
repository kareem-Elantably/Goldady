<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Gold extends Model
{
    protected $table = 'golds';
    protected $primaryKey = 'GoldID';
    public $timestamps = false;

    protected $fillable = ['Karat', 'Type', 'SafeID', 'Price'];

    public function safe()
    {
        return $this->belongsTo(Safe::class, 'SafeID');
    }

    public function transactions()
    {
        return $this->hasMany(Transaction::class, 'GoldID');
    }

}
