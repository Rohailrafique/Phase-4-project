import React from 'react'
import {Link} from 'react-router-dom'
export default function NavBar({setUser, user}) {
    const handleLogOut = () =>{
        fetch('/logout', {
            method: 'DELETE'
        }).then(setUser())
    }
    return (
        <div>
            <Link to='/blogs'>Blog Feed</Link>
            <Link to={`/followers/${user.username}`}>Connections</Link>
            <Link to={`/users/${user.username}`}>Profile</Link>
            <Link to= '/' onClick={handleLogOut}>Log Out</Link>
            
        </div>
    )
}
