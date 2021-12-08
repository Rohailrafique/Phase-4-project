import React, { useState } from 'react';

export default function Login({ setUsername }) {
    const [userInfo, setUserInfo] = useState({
        username: "",
        password: ""
    });

    async function handleLoginSubmit(e) {
        e.preventDefault();
        
        const response = await fetch("http://localhost:3000/login", {
            method: "POST",
            // mode: 'cors',
            // cache: 'no-cache',
            headers: { 
                "Content-Type": "application/json",
                // "withCredentials": true,
                // "Access-Control-Allow-Credentials": true
            },
            // redirect: 'follow',
            // referrer: 'no-referrer',
            // credentials: 'include',
            body: JSON.stringify(userInfo),
        })
        
        const data = await response.json();
        if (response.ok) {
            console.log(data);
            setUsername(data.username)
        }
        else {alert(data.errors.join("\n \n"))} 

        }

    function handleOnChange(e) {
        setUserInfo({ ...userInfo, [e.target.name]: e.target.value });
    }

    return (
        <div>
             <form onSubmit={handleLoginSubmit}>
                <label>Username:</label>
                <input type='text' name="username" value={userInfo.username} onChange={handleOnChange} required></input>
                <label>Password:</label>
                <input type='password' name="password" value={userInfo.password} onChange={handleOnChange} required></input>
                <button>Login</button>
            </form>
            
        </div>
    )
}
