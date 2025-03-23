"use client";

import { motion } from "motion/react";
import Image from "next/image";

type SocialLinkProps = {
  href: string;
  children: React.ReactNode;
};

interface SocialIconProps {
  title: string;
  path: string;
  className?: string;
}

// eslint-disable-next-line @typescript-eslint/no-unused-vars
const SocialIcon: React.FC<SocialIconProps> = ({
  title,
  path,
  className = "w-6 h-6",
}) => {
  return (
    <motion.svg
      role="img"
      viewBox="0 0 24 24"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
      initial={{ scale: 0, opacity: 0 }}
      animate={{ scale: 1, opacity: 1 }}
      transition={{ duration: 0.5, ease: "easeInOut" }}
      whileHover={{ scale: 1.2, rotate: 10 }}
      whileTap={{ scale: 0.9 }}
    >
      <title>{title}</title>
      <motion.path
        d={path}
        fill="none"
        initial={{ pathLength: 0, pathOffset: 0, opacity: 0 }}
        animate={{
          pathLength: 1,
          pathOffset: 0,
          opacity: 1,
          fill: "white",
          stroke: "black",
        }}
        transition={{
          duration: 1.5,
          ease: "easeInOut",
          fill: { delay: 1, duration: 0.5 },
        }}
      />
    </motion.svg>
  );
};

export default function Home() {
  const socials: SocialLinkProps[] = [
    {
      href: "https://github.com/sownt",
      children: (
        <Image src="/icons/github.svg" alt="GitHub" width={24} height={24} />
      ),
    },
    {
      href: "mailto:contact@sownt.com",
      children: (
        <Image src="/icons/email.svg" alt="Email" width={24} height={24} />
      ),
    },
    {
      href: "https://t.me/sowntt",
      children: (
        <Image
          src="/icons/telegram-plane.svg"
          alt="Telegram"
          width={24}
          height={24}
        />
      ),
    },
    {
      href: "https://www.facebook.com/thaison181",
      children: (
        <Image
          src="/icons/facebook.svg"
          alt="Facebook"
          width={24}
          height={24}
        />
      ),
    },
    {
      href: "https://www.linkedin.com/in/sownt",
      children: (
        <Image
          src="/icons/linkedin.svg"
          alt="LinkedIn"
          width={24}
          height={24}
        />
      ),
    },
  ];

  const itemVariants = {
    hidden: { opacity: 0, y: 20 },
    visible: (i: number) => ({
      opacity: 1,
      y: 0,
      transition: {
        delay: i * 0.3,
        duration: 0.5,
        ease: "easeOut",
      },
    }),
  };

  const codeVariants = {
    hidden: { opacity: 0, scale: 0.8 },
    visible: {
      opacity: 1,
      scale: 1,
      transition: {
        duration: 0.3,
        ease: "easeOut",
      },
    },
  };

  return (
    <div className="grid grid-rows-[20px_1fr_20px] items-center justify-items-center min-h-screen p-8 pb-20 gap-16 sm:p-20 font-[family-name:var(--font-comfortaa)]">
      <main className="flex flex-col gap-[32px] row-start-2">
        <div className="flex flex-col lg:flex-row items-center gap-16">
          <motion.div
            className="flex-1/3"
            initial={{ opacity: 0, scale: 0.8 }}
            animate={{
              opacity: 1,
              scale: 1,
              transition: {
                duration: 0.5,
                ease: "easeInOut",
              },
            }}
            whileHover={{ scale: 1.1 }}
          >
            <Image
              src="/profile-min.png"
              alt="Avatar"
              width={192}
              height={192}
            />
          </motion.div>
          <ol className="flex-2/3 list-inside text-lg/6 text-center lg:text-left">
            <motion.li
              className="mb-2 tracking-[-.01em]"
              custom={0}
              initial="hidden"
              animate="visible"
              variants={itemVariants}
            >
              {"Hi, I'm "}
              <motion.code
                className="bg-black/[.05] dark:bg-white/[.06] px-1 py-0.5 rounded font-semibold"
                initial="hidden"
                animate="visible"
                variants={codeVariants}
              >
                Sơn
              </motion.code>
              .
            </motion.li>

            <motion.li
              className="mb-8 tracking-[-.01em]"
              custom={1}
              initial="hidden"
              animate="visible"
              variants={itemVariants}
            >
              {"Mobile Developer in Hanoi, Vietnam."}
            </motion.li>

            <li className="tracking-[-.01em]">
              <div className="flex gap-4 items-center justify-center lg:justify-start">
                {socials.map(({ href, children }, index) => (
                  <motion.a
                    key={index}
                    initial="hidden"
                    animate="visible"
                    variants={itemVariants}
                    whileHover={{ scale: 1.1 }}
                    href={href}
                    target="_blank"
                    rel="noopener noreferrer"
                  >
                    {children}
                  </motion.a>
                ))}
              </div>
            </li>
          </ol>
        </div>
      </main>
      {/* <footer className="row-start-3 flex gap-[24px] flex-wrap items-center justify-center">
        <a
          className="flex items-center gap-2 hover:underline hover:underline-offset-4"
          href="https://nextjs.org/learn?utm_source=create-next-app&utm_medium=appdir-template-tw&utm_campaign=create-next-app"
          target="_blank"
          rel="noopener noreferrer"
        >
          <Image
            aria-hidden
            src="/file.svg"
            alt="File icon"
            width={16}
            height={16}
          />
          Learn
        </a>
        <a
          className="flex items-center gap-2 hover:underline hover:underline-offset-4"
          href="https://vercel.com/templates?framework=next.js&utm_source=create-next-app&utm_medium=appdir-template-tw&utm_campaign=create-next-app"
          target="_blank"
          rel="noopener noreferrer"
        >
          <Image
            aria-hidden
            src="/window.svg"
            alt="Window icon"
            width={16}
            height={16}
          />
          Examples
        </a>
        <a
          className="flex items-center gap-2 hover:underline hover:underline-offset-4"
          href="https://nextjs.org?utm_source=create-next-app&utm_medium=appdir-template-tw&utm_campaign=create-next-app"
          target="_blank"
          rel="noopener noreferrer"
        >
          <Image
            aria-hidden
            src="/globe.svg"
            alt="Globe icon"
            width={16}
            height={16}
          />
          Go to nextjs.org →
        </a>
      </footer> */}
    </div>
  );
}
