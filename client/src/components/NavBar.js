import React, { useContext } from 'react'
import {Link} from 'react-router-dom'
import { UserContext } from '../context/user';

export default function NavBar() {
    const {user, setUser} = useContext(UserContext);
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
            <Link to='/blogs/new'>New Blog Post</Link>
            <Link to= '/' onClick={handleLogOut}>Log Out</Link>
            
        </div>
    )
}
