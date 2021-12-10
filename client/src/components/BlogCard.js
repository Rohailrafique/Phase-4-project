import React, { useContext } from "react";
import { UserContext } from "../context/user";
import { useNavigate } from "react-router-dom";

export default function BlogCard({ post }) {
  const { user, setUser } = useContext(UserContext);
  const navigate = useNavigate();
  return (
    <div
      onClick={() => navigate(`/blogs/${post.id}`)}
      className="card border-dark m-3 blogcard"
    >
      <div className="card-header ">
              <img
                id="card-thumbnail"
                src={post.user.image_url}
                className="img-thumbnail"
                alt="img-thumbnail"
              />
            <div className="d-inline-block ms-3">
              <h5 className="card-title">{post.title}</h5>
              <h6 className="card-subtitle mb-2 text-muted">
                Author: {post.user.username}
              </h6>
        </div>
      </div>
      <div className="card-body">
        <p className="card-text">{post.condensed_content}</p>
      </div>
    </div>
  );
}
