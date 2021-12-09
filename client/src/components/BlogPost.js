import React, { useContext, useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import ReactMarkdown from "react-markdown";
import { UserContext } from "../context/user";

export default function BlogPost() {
  const { user, setUser } = useContext(UserContext);
  const navigate = useNavigate();
  const [blogPost, setBlogPost] = useState();
  const params = useParams();



  useEffect(() => {
    fetch(`/posts/${params.id}`)
      .then((resp) => resp.json())
      .then((data) => setBlogPost(data));
  }, []);

  async function handleDeleteClick() {
    const response = await fetch(`/posts/${params.id}`, {
      method: "DELETE",
    });

    const data = await response.json();
    if (response.ok) {
      navigate("/");
    } else {
      alert(data.errors.join("\n \n"));
    }
  }

  function handleEditClick(blogPost) {
    navigate(`/blogs/${blogPost.id}/edit`)
  }

  if (!blogPost) return null;

  return (
    <div className="BlogPost">
      <h3>{blogPost.title}</h3>
      <span>
        <ReactMarkdown children={blogPost.content} />
      </span>
      {user.id === blogPost.user.id ? (
        <>
          <button onClick={(e)=>handleEditClick(blogPost)}>Edit post</button>
          <button onClick={handleDeleteClick}>Delete post</button>
        </>
      ) : null}
      <p>Reaction</p>
      <p>Reaction</p>
      <p>Reaction</p>
    </div>
  );
}
