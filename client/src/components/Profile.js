import React from "react";
import BlogFeed from "./BlogFeed";
import { useState, useEffect } from "react";
import { useParams } from "react-router-dom";

export default function Profile({user}) {
  const params = useParams();
  const [userProfile, setUserProfile] = useState([]);
  useEffect(() => {
    fetch(`/profile/${params.username}`)
      .then((res) => res.json())
      .then((data) => setUserProfile(data));
  }, []);

  return (
    <div>
      <div className="userInfo">
        <img src={userProfile.image_url}></img>
        <h2>{userProfile.display_name}</h2>
        <p>{userProfile.username}</p>
        <button>Edit Profile</button>
        <a href="#LinkedIn">LinkedIn</a>
        <a href="#Twitter">Twitter</a>
        <a href="#Facebook">Facebook</a>
      </div>
      <div className="userAbout"></div>
      <div className="userContact"></div>
      <div className="userPosts">
        {userProfile.id ? <BlogFeed user={user} userProfile={userProfile} /> : null}
      </div>
    </div>
  );
}
