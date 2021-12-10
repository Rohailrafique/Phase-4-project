import React, { useContext, useState } from 'react';
import { UserContext } from '../context/user';

export default function Login() {
    const {user, setUser} = useContext(UserContext);
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
             <form onSubmit={handleLoginSubmit} style={{margin: 'auto', 'max-width': '600px'}}>
                <label className='form-label'>Username:</label>
                <input type='text' name="username" className='form-control border-dark' value={userInfo.username} onChange={handleOnChange} required></input>
                <label className='form-label'>Password:</label>
                <input type='password' name="password" className='form-control border-dark' value={userInfo.password} onChange={handleOnChange} required></input>
                <div style={{textAlign: 'center'}} className='mt-3'>
                    <button className='btn btn-dark'>Login</button>
                </div>
            </form>
            
        </div>
    )
}
