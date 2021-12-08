import React, { useState } from 'react'
import { useNavigate } from 'react-router-dom';

export default function BlogForm() {
    const [blogData, setBlogData] = useState({
        title: '',
        content: ''
    });
    const navigate = useNavigate();

    const handleSubmit = async (e) => {
        e.preventDefault();

        const response = await fetch('/posts', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(blogData)
        });
        const data = await response.json();
        if (response.ok) {
            navigate(`/blogs/${data.id}`)
        } else {
            alert(data.errors.join("\n \n"))
        }
    }

    const handleChange = (e) => {
        setBlogData({ ...blogData, [e.target.name]: e.target.value })
    }
    return (
        <div className='newBlog'>
            <form onSubmit={handleSubmit}>
                <label>Title:</label>
                <input type='text' name='title' value={blogData.title} onChange={handleChange} required></input>
                <label>Body:</label>
                <textarea name='content' value={blogData.content} onChange={handleChange}></textarea>
                <button>Submit</button>
            </form>
        </div>
    )
}
