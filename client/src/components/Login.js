import React, { useState } from 'react';

export default function Login({ setUser }) {
    const [userInfo, setUserInfo] = useState({
        username: "",
        password: ""
    });

    async function handleLoginSubmit(e) {
        e.preventDefault();
        
        const response = await fetch("/login", {
            method: "POST",
            headers: { 
                "Content-Type": "application/json",
            },
            body: JSON.stringify(userInfo),
        })
        
        const data = await response.json();
        if (response.ok) {
            console.log(data);
            setUser(data)
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
