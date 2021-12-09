import React, { useContext } from 'react'
import { Link } from 'react-router-dom'
import { UserContext } from '../context/user';
// import { Form, FormControl } from 'react-bootstrap';

export default function NavBar() {
    const { user, setUser } = useContext(UserContext);
    const handleLogOut = () => {
        fetch('/logout', {
            method: 'DELETE'
        }).then(setUser())
    }
    return (
        <div id='navBar' className="navbar navbar-expand-xl navbar-dark bg-dark container-fluid sticky-top">
            <Link className='nav-link text-light' to='/blogs'>Console.Blog</Link>
            <Link className='nav-link text-light' to={`/followers/${user.username}`}>Connections</Link>
            <Link className='nav-link text-light' to={`/users/${user.username}`}>Profile</Link>
            <Link className='nav-link text-light' to='/blogs/new'>New Blog Post</Link>
            <form className="d-flex ms-auto">
                <input className="form-control me-2" type="search" placeholder="Search" aria-label="Search" />
                <button className="btn btn-outline-light" type="submit">Search</button>
            </form>
            <div className='nav-item dropdown'>
                <img src={user.image_url} className='nav-img-thumbnail dropdown-toggle' data-bs-toggle="dropdown" role='button'></img>
                <ul className='dropdown-menu dropdown-menu-end mt-2'>
                    <Link className='nav-link text-dark dropdown-item' to='/' onClick={handleLogOut}>Log Out</Link>
                    
                </ul>
            </div>

        </div>
    )
}
