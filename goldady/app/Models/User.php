<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\Model;

class User extends Model
{

    protected $table = 'users';
    protected $primaryKey = 'UserID';
    public $timestamps = false;

    protected $fillable = ['Username', 'Email', 'TotalAmount'];


    public function transactions()
    {
        return $this->hasMany(Transaction::class, 'UserID');
    }


}
