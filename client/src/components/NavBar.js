import React from 'react'

export default function NavBar({setUser}) {
    const handleLogOut = () =>{
        fetch('/logout', {
            method: 'DELETE'
        }).then(setUser())
    }
    return (
        <div>
            <a href='#'>Blog Feed</a>
            <a href='#'>Followers</a>
            <a href='#'>Following</a>
            <a href='#'>Profile</a>
            <a href='#' onClick={handleLogOut}>Log Out</a>
            
        </div>
    )
}
