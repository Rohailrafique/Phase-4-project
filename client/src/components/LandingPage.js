import React from 'react'
import Login from './Login'
import { useState } from 'react'
import Signup from './Signup'

export default function LandingPage() {
    const [signUp, setSignUp] = useState(false)

    return (
        <div>
            <h1 className='border-bottom border-dark' style={{textAlign: 'center'}}>Console.Blog({signUp ? 'create account' : 'log in'})</h1>
            {signUp?<Signup/> :<Login />}
            <div style={{textAlign: 'center'}} className='mt-5'>
                <button className='btn btn-secondary' onClick={()=>setSignUp(!signUp)}>{signUp ? 'Have an account?' : 'Need an account?'}</button>    
            </div>
        </div>
    )
}
