import React from "react";
import BlogCard from "./BlogCard";
import { useState, useEffect } from "react";


export default function BlogFeed({userProfile}) {
  const [feedData, setFeedData] = useState([]);
  const [filteredBlogs, setFilteredBlogs] = useState([])

  
  useEffect(() => {
    const endPoint = userProfile ? `/posts?user_id=${userProfile.id}`:"/posts"
    fetch(endPoint)
      .then((res) => res.json())
      .then((data) => {
        setFeedData(data)
        setFilteredBlogs(data)
      });
  }, [userProfile]);

  function handleChange(e){
    let filteredData = feedData.filter((blog) => blog.title.includes(e.target.value))
    setFilteredBlogs(filteredData)
  }
  function handleSubmit(e){
    e.preventDefault()


  }


  return (
    <>
    <div>
    <form onSubmit={handleSubmit} className="d-flex ms-auto position-fixed z-1">
        <input 
          className="form-control me-2 "
          role="search"
          type="search"
          placeholder="Search by blog title"
          aria-label="Search"
          onChange={handleChange}
        />
      </form>
    </div>
    <div className="mt-5">
      {filteredBlogs.map((post) => {
        return <BlogCard className="mt-2" key={post.id} post={post}/>;
      })}
    </div>
    </>
  );
}
