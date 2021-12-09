import React, { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom';
import { useParams } from "react-router-dom";
import ReactMarkdown from "react-markdown";
import remarkGfm from 'remark-gfm';




export default function BlogForm() {
    const [blogData, setBlogData] = useState({
        title: '',
        content: ''
    });
    const navigate = useNavigate();
    const params = useParams();

    useEffect(() => {
        if (params.id)
            fetch(`/posts/${params.id}`)
                .then(r => r.json())
                .then(data => setBlogData(data))
    }, [])


    const handleSubmit = async (e) => {
        e.preventDefault();

        const response = await fetch(params.id ? `/posts/${params.id}` : '/posts', {
            method: params.id ? 'PATCH' : 'POST',
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
        <div className='container-fluid mt-5'>
            <div className='row'>
                <form className='col-6' onSubmit={handleSubmit}>
                    <label className='form-label'>Title:</label>
                    <input className='form-control' type='text' name='title' value={blogData.title} onChange={handleChange} required></input>
                    <br />
                    <label className='form-label'>Body:</label>
                    <textarea id='blogText' className='form-control' name='content' value={blogData.content} onChange={handleChange}></textarea>
                    <button className='btn btn-dark mt-5'>Submit</button>
                </form>
                <div className='col-6'>
                <label id='preview'>Preview:</label>
                    <div id='blogPreview'className='card border-dark'>
                    
                    <h1>{blogData.title}</h1>
                    <ReactMarkdown children={blogData.content} remarkPlugins={[remarkGfm]} />
                    </div>
                </div>

            </div>
        </div>
    )
}
