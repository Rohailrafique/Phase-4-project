import React, { useEffect, useState } from 'react'
import { useParams } from "react-router-dom";
import ReactMarkdown from 'react-markdown';

export default function BlogPost() {
    const [blogPost, setBlogPost] = useState({});
    const params = useParams();

    console.log(blogPost);

    useEffect(() => {
        fetch(`/posts/${params.id}`)
            .then(resp => resp.json())
            .then(data => setBlogPost(data))
    }, [])

    return (
        <div className='BlogPost'>
            <h3>{blogPost.title}</h3>
            <p><ReactMarkdown children={blogPost.content} /></p>
            <p>Reaction</p>
            <p>Reaction</p>
            <p>Reaction</p>
            
        </div>
    )
}
