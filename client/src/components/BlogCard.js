import React from 'react'

export default function BlogCard({post}) {
    return (
        <div className='blogPreview'>
            <h6>{post.title}</h6>
            <p>{post.content}</p>
        </div>
    )
}
