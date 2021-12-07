import React from 'react'

export default function BlogForm() {
    return (
        <div className='newBlog'>
            <form>
                <label>Title:</label>
                <input type='text' required></input>
                <label>Body:</label>
                <textarea></textarea>
                <button>Submit</button>
            </form>
        </div>
    )
}
