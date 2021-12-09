import React from "react";
import BlogCard from "./BlogCard";
import { useState, useEffect } from "react";


export default function BlogFeed({userProfile}) {
  const [feedData, setFeedData] = useState([]);

  useEffect(() => {
    const endPoint = userProfile ? `/posts?user_id=${userProfile.id}`:"/posts"
    fetch(endPoint)
      .then((res) => res.json())
      .then((data) => setFeedData(data));
  }, [userProfile]);

  return (
    <div>
      {feedData.map((post) => {
        return <BlogCard key={post.id} post={post}/>;
      })}
    </div>
  );
}
