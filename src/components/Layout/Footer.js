// Footer.js
import React, { Fragment } from "react";
import styles from "./Footer.module.css";
import imageImage from "../../assets/image.jpg";

const Footer = (props) => {
  return (
    <Fragment>
      
      <footer className={styles.footer}>
        <div className={styles.footerContent}>
          <div className={styles.row}>
                <pr>     <a href="#" className="fa fa-facebook"></a></pr>
                <pr>     <a href="#" className="fa fa-instagram"></a></pr>
                <pr>     <a href="#" className="fa fa-youtube"></a></pr>
                <pr>     <a href="#" className="fa fa-twitter"></a></pr>
          </div>
          <div className={styles.row}>
            <ul>
              <li><a href="#">Contact us</a></li>
              <li><a href="#">Our Services</a></li>
              <li><a href="#">Privacy Policy</a></li>
              <li><a href="#">Terms & Conditions</a></li>
              <li><a href="#">Career</a></li>
            </ul>
          </div>
          <div className={styles.row}>
            Bat24am Copyright © 2024 bat24am - All rights reserved ||
            Designed By: Cloud Cruisers
          </div>
          
        <div className={styles['main-image']}>
        <pr><img src={imageImage} /></pr> 
          </div>
        </div>
      </footer>
    </Fragment>
  );
};

export default Footer;
