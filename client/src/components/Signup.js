import React from 'react'


export default function Signup() {


    return (
        <div>
            <form>
                <label>Email:</label>
                <input type='email' required></input>
                <label>Username:</label>
                <input type='text' required></input>
                <label>Password:</label>
                <input type='password' required></input>
                <label>Password Confirmation:</label>
                <input type='password' required></input>
                <label>Display Name:</label>
                <input type='text' required></input>
                <label>Profile Image:</label>
                <input type='url'></input>
                <label>LinkedIn:</label>
                <input type='url' ></input>
                <label>Twitter:</label>
                <input type='url'></input>
                <label>Facebook:</label>
                <input type='url'></input>
                <button>Signup</button>



            </form>

        </div>
    )
}
