import React, { useContext } from 'react'
import { UserContext } from '../context/user';
import { useNavigate } from 'react-router-dom';

export default function BlogCard({post}) {
    const {user, setUser} = useContext(UserContext);
    const navigate = useNavigate();
    return (
        <div className='blogPreview' onClick={() => navigate(`/blogs/${post.id}`)}>
            <h6>{post.title}</h6>
            <p>{post.content}</p>
            <img src={post.user.image_url} />
        </div>
    )
}
