import React, { useEffect, useState, useContext } from "react";
import { Link } from "react-router-dom";
import { UserContext } from "../context/user";
// import { Form, FormControl } from 'react-bootstrap';

export default function NavBar({ fun, handleFun}) {
  const { user, setUser } = useContext(UserContext);
  // const [fun, setFun] = useState();
  const [searchField, setSearchField] = useState();
  const [userList, setUserList] = useState([]);
  const handleLogOut = () => {
    fetch("/logout", {
      method: "DELETE",
    }).then(setUser());
  };

  function handleChange(e) {
    let searchedUser = userList.filter((users) =>
      users.username.includes(e.target.value)
    );
    setSearchField(searchedUser);
    if (e.target.value === "")
    setSearchField(false);
  }

  useEffect(() => {
    fetch("/users").then((res) => res.json().then((data) => setUserList(data)));
  }, []);

  return (
    <div
      id="navBar"
      className="navbar navbar-expand-xl navbar-dark bg-dark container-fluid sticky-top"
    >
      <Link className="nav-link text-light" to="/blogs" onClick={() => handleFun('this is awesome!')} >

          Console.Blog(<span className={fun && fun.startsWith("Couldn't find") && "text-danger"}>{fun}</span>)
        
      </Link>
      <span className="text-light">|</span>
      <Link className="nav-link text-light" to={`/followers/${user.username}`}>
        Connections
      </Link>
      <span className="text-light">|</span>
      <Link className="nav-link text-light" to={`/users/${user.username}`}>
        Profile
      </Link>
      <span className="text-light">|</span>
      <Link className="nav-link text-light" to="/blogs/new">
        New Post
      </Link>
      <form className="d-flex ms-auto">
        <input
          className="form-control me-2"
          role="search"
          type="search"
          placeholder="Search User"
          aria-label="Search"
          onChange={handleChange}
        />
          {searchField ?
        <ul id="userList" className="dropdown-menu dropdown-menu-end"> 
         {searchField.map((listItem) => (
                <Link to={`/users/${listItem.username}`} className="nav-link text-dark dropdown-item">
                    <img className="search-thumbnail"  src={listItem.image_url}></img>{listItem.username}</Link>
              ))}
        </ul>
            : null}
      </form>
      <div className="nav-item dropdown">
        <img
          alt='profile thumbnail'
          src={user.image_url}
          className="nav-img-thumbnail dropdown-toggle"
          data-bs-toggle="dropdown"
          role="button"
        ></img>
        <ul className="dropdown-menu dropdown-menu-end mt-2">
          <Link
            className="nav-link text-dark dropdown-item"
            to="/"
            onClick={handleLogOut}
          >
            Log Out
          </Link>
        </ul>
      </div>
    </div>
  );
}
