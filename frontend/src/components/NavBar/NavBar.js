import React from "react";
import { Button } from "../elements";
const BASE_URL = 'http://localhost:3000';

const TOP_NAV = {
    resume: {
        url: `${BASE_URL}/resume`,
        title: 'Resume'
    },
    worksona: {
        url: `${BASE_URL}/worksona`,
        title: 'Worksona'
    },
    toybox: {
        url: `${BASE_URL}/toybox`,
        title: 'ToyBox'
    },
    skeletons: {
        url: `${BASE_URL}/skeletons`,
        title: 'Skeletons'
    }
};

export function NavBar() {
    return (
        <nav>
            {Object.values(TOP_NAV).map((item) => (
                <Button
                    key={item.title}
                    as="a"
                    href={item.url}
                >
                    {item.title}
                </Button>
            ))}
        </nav>
    );
}