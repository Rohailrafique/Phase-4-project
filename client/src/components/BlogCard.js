import React, { useContext } from 'react'
import { UserContext } from '../context/user';
import { useNavigate } from 'react-router-dom';

export default function BlogCard({post}) {
    const {user, setUser} = useContext(UserContext);
    const navigate = useNavigate();
    return (
        // <div className='blogPreview' onClick={() => navigate(`/blogs/${post.id}`)}>
        //     <h6>{post.title}</h6>
        //     <p>{post.content}</p>
        //     <img src={post.user.image_url} />
        // </div>
<div onClick={() => navigate(`/blogs/${post.id}`)} className="card border-dark m-3">
    <div className='card-header'>
      <h5 className="card-title">{post.title}</h5>
        <h6 className="card-subtitle mb-2 text-muted">Author: {post.user.username}</h6>
    </div>
  <div className="card-body">
    <p className="card-text">{post.content}</p>
    <img src={post.user.image_url} className="img-thumbnail" alt="img-thumbnail"></img>
  </div>
</div>
    )
}
{/* <div class="card">
  <div class="card-body">
    <h5 class="card-title">{post.title}</h5>
    <h6 class="card-subtitle mb-2 text-muted">Author: {post.user.username}</h6>
    <p class="card-text">{post.content}</p>
    <img src={post.user.image_url} class="img-thumbnail" alt="img-thumbnail"></img>
  </div>
</div> */}