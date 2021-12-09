import React from "react";
import BlogFeed from "./BlogFeed";
import { useContext, useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import { UserContext } from '../context/user';

export default function Profile() {
  const {user, setUser} = useContext(UserContext);
  const params = useParams();
  const [userProfile, setUserProfile] = useState([]);
  useEffect(() => {
    fetch(`/profile/${params.username}`)
      .then((res) => res.json())
      .then((data) => setUserProfile(data));
  }, [params.username]);


  return (
    <div className='container-fluid'>
      <div className="profile">
        <div className='profile-info m-3'>
          
        <img className='img-thumbnail border-dark' src={userProfile.image_url}></img>
        <h2>{userProfile.display_name}</h2>
        <p>{userProfile.username}</p>
        <div className='nav flex-column'>
        <a className="bi bi-linkedin" href={userProfile.linkedin_url} target='_blank'></a>
        <a className="bi bi-twitter" href="#Twitter"></a>
        <a className='bi bi-facebook' href="#Facebook"></a>
        </div>
        </div>
      <div className="profile-blogs">
        {userProfile.id ? <BlogFeed user={user} userProfile={userProfile} /> : null}
      </div>
      </div>
    </div>
  );
}
