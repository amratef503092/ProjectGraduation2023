<?php

namespace App\Http\Controllers\Api\Auth;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\Api\RegisterRequest;
use App\Http\Traits\ApiResponser;

class RegisterController extends Controller
{
    use ApiResponser;
    public function register(RegisterRequest $request)
    {
        // dd($request->password);
        $data = User::create($request->validated());

        return $this->success([
            'user' => $data,
            'token' => $data->createToken('api-auth-token')->plainTextToken,
        ] ,'You are Registerd successfully');
    }
}
