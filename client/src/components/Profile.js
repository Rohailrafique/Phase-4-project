import React from "react";
import BlogFeed from "./BlogFeed";
import { useContext, useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { UserContext } from '../context/user';

export default function Profile({ handleFun }) {
  const {user, setUser} = useContext(UserContext);
  const params = useParams();
  const navigate = useNavigate();
  const [userProfile, setUserProfile] = useState([]);
  useEffect(() => {
    fetch(`/profile/${params.username}`)
      .then((res) => {
        if (res.ok) {
          res.json().then((data) => setUserProfile(data));
        } else {
          res.json().then(data => handleFun(data.error))
          navigate('/')
        }
      })
      
  }, [params.username]);


  return (
    <div className='container-fluid'>
      <div className="profile">
        <div className='profile-info m-3'>
          
        <img className='img-thumbnail border-dark' src={userProfile.image_url}></img>
        <h2>{userProfile.display_name}</h2>
        <p>{userProfile.username}</p>
        <div className='nav flex-column'>
        {userProfile.linkedin_url && <a className="bi bi-linkedin" href={userProfile.linkedin_url} target='_blank'></a>}
        {userProfile.twitter_url && <a className="bi bi-twitter" href={userProfile.twitter_url} target='_blank'></a>}
        {userProfile.facebook_url &&<a className='bi bi-facebook' href={userProfile.facebook_url} target='_blank'></a>}
        </div>
        </div>
      <div className="profile-blogs">
        {userProfile.id ? <BlogFeed user={user} userProfile={userProfile} /> : null}
      </div>
      </div>
    </div>
  );
}
