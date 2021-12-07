import React from 'react'

export default function Login() {
    return (
        <div>
             <form>
                <label>Username:</label>
                <input type='text' required></input>
                <label>Password:</label>
                <input type='password' required></input>
                <button>Login</button>
            </form>
            
        </div>
    )
}
