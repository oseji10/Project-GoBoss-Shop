import { serverSideTranslations } from 'next-i18next/serverSideTranslations';
import type { GetStaticProps } from 'next';
import { useTranslation } from 'next-i18next';
import type { CreateContactUsInput, NextPageWithLayout } from '@/types';
import React, { useState } from 'react';
import { useMutation } from 'react-query';
import type { SubmitHandler } from 'react-hook-form';
import toast from 'react-hot-toast';
import GeneralLayout from '@/layouts/_general-layout';
import { LocationIcon } from '@/components/icons/contact/location-icon';
import { PhoneIcon } from '@/components/icons/contact/phone-icon';
import { MailIcon } from '@/components/icons/contact/mail-icon';
import { Form } from '@/components/ui/forms/form';
import Input from '@/components/ui/forms/input';
import Textarea from '@/components/ui/forms/textarea';
import Seo from '@/layouts/_seo';
import Button from '@/components/ui/button';
import client from '@/data/client';
import PageHeading from '@/components/ui/page-heading';
import routes from '@/config/routes';
import * as yup from 'yup';
import { useSettings } from '@/data/settings';

function ContactInfo({
  icon,
  title,
  description,
}: {
  icon: React.ReactNode;
  title: string;
  description: string;
}) {
  return (
    <div className="flex max-w-xs flex-row items-center pr-4 sm:pr-2 lg:max-w-sm lg:pr-0">
      <div className="flex w-12 flex-shrink-0 justify-center text-brand">
        {icon}
      </div>
      <div className="mt-0 ltr:pl-5 rtl:pr-5">
        <h3 className="mb-2 text-15px font-medium text-dark dark:text-light">
          {title}
        </h3>
        <p className="leading-[1.8em]">{description}</p>
      </div>
    </div>
  );
}

const contactUsFormSchema = yup.object().shape({
  name: yup.string().required(),
  email: yup.string().email().required(),
  subject: yup.string().required(),
  description: yup.string().required(),
});

const ContactUsPage: NextPageWithLayout = () => {
  const { t } = useTranslation('common');
  const { settings } = useSettings();
  const { contactDetails } = settings ?? {};
  let [reset, setReset] = useState<CreateContactUsInput | null>(null);
  const { mutate } = useMutation(client.settings.contactUs, {
    onSuccess: () => {
      toast.success('Successfully sent your message');
      setReset({
        name: '',
        email: '',
        subject: '',
        description: '',
      });
    },
    onError: (res) => {
      toast.error('Ops! something went wrong');
      console.log(res);
    },
  });
  const onSubmit: SubmitHandler<CreateContactUsInput> = (values) => {
    mutate(values);
  };
  return (
    <>
      <Seo
        title="Order Success"
        description="This order was succwssful."
        url={routes.contact}
      />
      <div className="mx-auto flex h-full w-full max-w-screen-xl flex-col p-4 sm:p-5">
      <PageHeading
  title={t('Order Successful!')}
  subtitle={
    'Your order was successfully placed. Please check your email for details. ' +
    'Click <a href="/">here</a> to continue shopping.'
  }
/>

        {/* <p >
              Your order was successfuly placed. Please check your email for details.
            </p> */}
        <div className="md:light:bg-light flex w-full flex-col overflow-hidden rounded-md px-4 py-5 sm:px-6 sm:py-8 md:p-10 md:shadow-card md:dark:bg-dark-200 md:dark:shadow-none lg:flex-row lg:p-0">
          
        </div>
      </div>
    </>
  );
};

ContactUsPage.getLayout = function getLayout(page) {
  return <GeneralLayout>{page}</GeneralLayout>;
};

export const getStaticProps: GetStaticProps = async ({ locale }) => {
  return {
    props: {
      ...(await serverSideTranslations(locale!, ['common'])),
    },
    revalidate: 60, // In seconds
  };
};

export default ContactUsPage;
