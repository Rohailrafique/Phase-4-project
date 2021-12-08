import React from 'react'
import Login from './Login'
import { useState } from 'react'
import Signup from './Signup'

export default function LandingPage() {
    const [signUp, setSignUp] = useState(false)

    return (
        <div style={{textAlign: 'center'}}>
        <h1>Console Blog</h1>
        <br/>
        <br/>
        <br/>
        <br/>
        {signUp?<Signup/> :<Login />}
        <br/>
        <br/>
       
        <button onClick={()=>setSignUp(!signUp)}>New User</button>
        
        
         </div>
    )
}
