import React from "react";
import { useContext, useState } from "react";
import { UserContext } from '../context/user';
// import { Alert } from 'react-alert';

export default function Signup() {
  const {user, setUser} = useContext(UserContext);
  const [newUser, setNewUser] = useState({
    email: "",
    display_name: "",
    password: "",
    password_confirmation: "",
    image_url: "",
    twitter_url: "",
    facebook_url: "",
    linkedin_url: "",
    username: "",
  });
  async function handleSignupSubmit(e) {
    e.preventDefault();
    console.log(newUser);
   
    const response = await fetch("/users", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(newUser),
    })
    
    const data = await response.json()
    if (response.ok) {
      setUser(data)
      // TODO: reroute after signing in
    }
    else {alert(data.errors.join("\n \n"))} 

  }

  function handleOnChange(e) {
    setNewUser({ ...newUser, [e.target.name]: e.target.value });
  }

  return (
    <div>
      <form onSubmit={handleSignupSubmit}>
        <label>Email:</label>
        <input
          type="email"
          name="email"
          value={newUser.email}
          onChange={handleOnChange}
          required
        ></input>
        <label>Username:</label>
        <input
          type="text"
          name="username"
          value={newUser.username}
          onChange={handleOnChange}
          required
        ></input>
        <label>Password:</label>
        <input
          type="password"
          name="password"
          value={newUser.password}
          onChange={handleOnChange}
          required
        ></input>
        <label>Password Confirmation:</label>
        <input
          type="password"
          name="password_confirmation"
          value={newUser.password_confirmation}
          onChange={handleOnChange}
          required
        ></input>
        <label>Display Name:</label>
        <input
          type="text"
          name="display_name"
          value={newUser.display_name}
          onChange={handleOnChange}
          required
        ></input>
        <label>Profile Image:</label>
        <input
          type="url"
          name="profile_image"
          value={newUser.image_url}
          onChange={handleOnChange}
        ></input>
        <label>LinkedIn:</label>
        <input
          type="url"
          name="likedin_url"
          value={newUser.linkedin_url}
          onChange={handleOnChange}
        ></input>
        <label>Twitter:</label>
        <input
          type="url"
          name="twitter_url"
          value={newUser.twitter_url}
          onChange={handleOnChange}
        ></input>
        <label>Facebook:</label>
        <input
          type="url"
          name="facebook_url"
          value={newUser.facebook_url}
          onChange={handleOnChange}
        ></input>
        <button>Signup</button>
      </form>
    </div>
  );
}
