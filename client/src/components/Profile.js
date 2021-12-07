import React from 'react'
import BlogFeed from './BlogFeed'


export default function Profile() {
    return (
     <div>
         <div className='userInfo'>
            <img></img>
            <h2>Display Name</h2>
            <p>username</p>
            <button>Edit Profile</button>
            <a href='#LinkedIn'>LinkedIn</a>
            <a href='#Twitter'>Twitter</a>
            <a href='#Facebook'>Facebook</a>
         </div>
         <div className='userAbout'>
            
         </div>
         <div className='userContact'>

         </div>
         <div className='userPosts'>
            <BlogFeed/>
         </div>
      
     </div>

    )
}
