<?php

namespace App\Http\Controllers\Api\Auth;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\Api\LoginRequest;
use App\Http\Traits\ApiResponser;

class LoginController extends Controller
{
    use ApiResponser;

    public function login(LoginRequest $request)
    {
        $user = User::where('email', $request->email)->first();

        if(!$user || !Hash::check($request->password, $user->password)) {

            return $this->error('The provided credentials are incorrect.', 401);
        }

        return $this->success([
            'token' => $user->createToken('api-auth-token')->plainTextToken,
            'user' => $user,
        ], 'You are logged!');
    }


    public function logout(Request $request)
    {
        $request->user()->tokens()->delete();

        return [
            'message' => 'Tokens Revoked'
        ];
    }
}
